//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import "@openzeppelin/contracts/utils/Create2.sol";

import "@fractal-framework/core-contracts/contracts/ModuleFactoryBase.sol";
import "../interfaces/IGovernorModule.sol";
import "../interfaces/ITimelock.sol";

/// @dev Governor Factory used to deploy Gov Modules
/// @dev Deploys Timelock dependecies
contract GovernorFactory is ModuleFactoryBase {
    event GovernorCreated(address timelock, address governorModule);

    function initialize() external initializer {
        __initFactoryBase();
    }

    /// @dev Creates a Governor module
    /// @param creator The address creating the module
    /// @param data The array of bytes used to create the module
    /// @return address[] The array of addresses of the created module
    function create(address creator, bytes[] calldata data)
        external
        override
        returns (address[] memory)
    {
        address[] memory createdContracts = new address[](2);

        createdContracts[1] = createTimelock(creator, data);
        createdContracts[0] = createGovernor(creator, createdContracts[1], data);

        emit GovernorCreated(createdContracts[0], createdContracts[1]);

        return createdContracts;
    }

    function createTimelock(address creator, bytes[] memory data)
        private
        returns (address timelock)
    {
        // Create timelock
        timelock = Create2.deploy(
            0,
            keccak256(
                abi.encodePacked(
                    creator,
                    msg.sender,
                    block.chainid,
                    abi.decode(data[11], (bytes32))
                )
            ),
            abi.encodePacked(
                type(ERC1967Proxy).creationCode,
                abi.encode(address(abi.decode(data[4], (address))), "")
            )
        );

        // init timelock
        ITimelock(payable(timelock)).initialize(
            abi.decode(data[1], (address)),
            abi.decode(data[0], (address)),
            abi.decode(data[10], (uint256))
        );
    }

    function createGovernor(address creator, address timelock, bytes[] memory data)
        private
        returns (address governorModule)
    {
        // Create governor
        governorModule = Create2.deploy(
            0,
            keccak256(
                abi.encodePacked(
                    creator,
                    msg.sender,
                    block.chainid,
                    abi.decode(data[11], (bytes32))
                )
            ),
            abi.encodePacked(
                type(ERC1967Proxy).creationCode,
                abi.encode(address(abi.decode(data[3], (address))), "")
            )
        );
        // Init Governor
        IGovernorModule(governorModule).initialize(
            IVotesUpgradeable(abi.decode(data[2], (address))),
            ITimelock(payable(timelock)),
            abi.decode(data[5], (uint64)),
            abi.decode(data[6], (uint256)),
            abi.decode(data[7], (uint256)),
            abi.decode(data[8], (uint256)),
            abi.decode(data[9], (uint256)),
            abi.decode(data[1], (address))
        );
    }
}
