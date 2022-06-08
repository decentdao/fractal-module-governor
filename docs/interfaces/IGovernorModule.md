# IGovernorModule







*Governor Module used to implement 1 token 1 vote. This acts as an extension of the MVD and permissions are controlled by access control.Gov Module is extended by the timelock contract which creates a lockup period before execution.*

## Methods

### getVotes

```solidity
function getVotes(address account, uint256 blockNumber) external view returns (uint256)
```

module:reputation

*Voting power of an `account` at a specific `blockNumber`. Note: this can be implemented in a number of ways, for example by reading the delegated balance from one (or multiple), {ERC20Votes} tokens.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | Voting weight of this Address |
| blockNumber | uint256 | Checkpoint at this blockNumber |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### initialize

```solidity
function initialize(contract IVotesUpgradeable _token, contract ITimelockUpgradeable _timelock, uint64 _initialVoteExtension, uint256 _initialVotingDelay, uint256 _initialVotingPeriod, uint256 _initialProposalThreshold, uint256 _initialQuorumNumeratorValue, address _accessControl) external nonpayable
```



*Configures Gov Module implementationCalled once during deployment atomically*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _token | contract IVotesUpgradeable | Voting token uses snapshot feature |
| _timelock | contract ITimelockUpgradeable | Timelock vest proposals to allow detractors to exit system |
| _initialVoteExtension | uint64 | Allow users to vote if quorum attack is preformed |
| _initialVotingDelay | uint256 | Allow users to research proposals before voting period |
| _initialVotingPeriod | uint256 | Length of voting period (blocks) |
| _initialProposalThreshold | uint256 | Total tokens required to submit a proposal |
| _initialQuorumNumeratorValue | uint256 | Total votes needed to reach quorum |
| _accessControl | address | Address of Access Control |

### proposalDeadline

```solidity
function proposalDeadline(uint256 proposalId) external view returns (uint256)
```

module:core

*Block number at which votes close. Votes close at the end of this block, so it is possible to cast a vote during this block.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| proposalId | uint256 | keccak256 hash of proposal params |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### proposalThreshold

```solidity
function proposalThreshold() external view returns (uint256)
```



*Total vote weight required to create a proposal*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### propose

```solidity
function propose(address[] targets, uint256[] values, bytes[] calldatas, string description) external nonpayable returns (uint256)
```



*Create a new proposal. Vote start {IGovernor-votingDelay} blocks after the proposal is created and ends {IGovernor-votingPeriod} blocks after the voting starts. Emits a {ProposalCreated} event.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| targets | address[] | Contract addresses the DAO will call |
| values | uint256[] | Ether values to be sent to the target address |
| calldatas | bytes[] | Function Sigs w/ Params |
| description | string | Description of proposal |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### quorum

```solidity
function quorum(uint256 blockNumber) external view returns (uint256)
```

module:user-config

*Minimum number of cast voted required for a proposal to be successful. Note: The `blockNumber` parameter corresponds to the snaphot used for counting vote. This allows to scale the quroum depending on values such as the totalSupply of a token at this block (see {ERC20Votes}).*

#### Parameters

| Name | Type | Description |
|---|---|---|
| blockNumber | uint256 | Checkpoint at this blockNumber |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### state

```solidity
function state(uint256 proposalId) external view returns (enum IGovernorModule.ProposalState)
```



*Overriden version of the {Governor-state} function with added support for the `Queued` status.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| proposalId | uint256 | keccak256 hash of proposal params |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | enum IGovernorModule.ProposalState | undefined |

### votingDelay

```solidity
function votingDelay() external view returns (uint256)
```

module:user-config

*Delay, in number of block, between the proposal is created and the vote starts. This can be increassed to leave time for users to buy voting power, of delegate it, before the voting of a proposal starts.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### votingPeriod

```solidity
function votingPeriod() external view returns (uint256)
```

module:user-config

*Delay, in number of blocks, between the vote start and vote ends. NOTE: The {votingDelay} can delay the start of the vote. This must be considered when setting the voting duration compared to the voting delay.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |




