# TimelockUpgradeable







*Contract module which acts as a timelocked controller. When set as the executor for the DAO execute action, it enforces a timelock on all DAO executions initiated by the governor contract. This gives time for users of the controlled contract to exit before a potentially dangerous maintenance operation is applied.*

## Methods

### accessControl

```solidity
function accessControl() external view returns (contract IAccessControlDAO)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | contract IAccessControlDAO | undefined |

### cancel

```solidity
function cancel(bytes32 id) external nonpayable
```



*Cancel an operation. - the caller must be authorized.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| id | bytes32 | keccak256 hash of proposal params |

### dao

```solidity
function dao() external view returns (contract IDAO)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | contract IDAO | undefined |

### executeBatch

```solidity
function executeBatch(address[] targets, uint256[] values, bytes[] datas, bytes32 predecessor, bytes32 salt) external payable
```



*Execute an (ready) operation containing a batch of transactions. Emits one {CallExecuted} event per transaction in the batch. - the caller must be authorized*

#### Parameters

| Name | Type | Description |
|---|---|---|
| targets | address[] | Contract addresses the DAO will call |
| values | uint256[] | Ether values to be sent to the target address |
| datas | bytes[] | Function Sigs w/ Params  |
| predecessor | bytes32 | GovTimelock passes this as 0 |
| salt | bytes32 | Description Hash |

### getMinDelay

```solidity
function getMinDelay() external view returns (uint256 duration)
```



*Returns the minimum delay for an operation to become valid. This value can be changed by executing an operation that calls `updateDelay`.*


#### Returns

| Name | Type | Description |
|---|---|---|
| duration | uint256 | undefined |

### getTimestamp

```solidity
function getTimestamp(bytes32 id) external view returns (uint256 timestamp)
```



*Returns the timestamp at with an operation becomes ready (0 for unset operations, 1 for done operations).*

#### Parameters

| Name | Type | Description |
|---|---|---|
| id | bytes32 | keccak256 hash of proposal params |

#### Returns

| Name | Type | Description |
|---|---|---|
| timestamp | uint256 | undefined |

### hashOperationBatch

```solidity
function hashOperationBatch(address[] targets, uint256[] values, bytes[] datas, bytes32 predecessor, bytes32 salt) external pure returns (bytes32 hash)
```



*Returns the identifier of an operation containing a batch of transactions.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| targets | address[] | Contract addresses the DAO will call |
| values | uint256[] | Ether values to be sent to the target address |
| datas | bytes[] | Function Sigs w/ Params  |
| predecessor | bytes32 | GovTimelock passes this as 0 |
| salt | bytes32 | Description Hash |

#### Returns

| Name | Type | Description |
|---|---|---|
| hash | bytes32 | undefined |

### initialize

```solidity
function initialize(address _accessControl, address _dao, uint256 _minDelay) external nonpayable
```

Function for initializing the contract that can only be called once



#### Parameters

| Name | Type | Description |
|---|---|---|
| _accessControl | address | The address of the access control contract |
| _dao | address | The address of the dao contract |
| _minDelay | uint256 | init the contract with a given `minDelay`. |

### isOperation

```solidity
function isOperation(bytes32 id) external view returns (bool pending)
```



*Returns whether an id correspond to a registered operation. This includes both Pending, Ready and Done operations.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| id | bytes32 | keccak256 hash of proposal params |

#### Returns

| Name | Type | Description |
|---|---|---|
| pending | bool | undefined |

### isOperationDone

```solidity
function isOperationDone(bytes32 id) external view returns (bool done)
```



*Returns whether an operation is done or not.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| id | bytes32 | keccak256 hash of proposal params |

#### Returns

| Name | Type | Description |
|---|---|---|
| done | bool | undefined |

### isOperationPending

```solidity
function isOperationPending(bytes32 id) external view returns (bool pending)
```



*Returns whether an operation is pending or not.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| id | bytes32 | keccak256 hash of proposal params |

#### Returns

| Name | Type | Description |
|---|---|---|
| pending | bool | undefined |

### isOperationReady

```solidity
function isOperationReady(bytes32 id) external view returns (bool ready)
```



*Returns whether an operation is ready or not.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| id | bytes32 | keccak256 hash of proposal params |

#### Returns

| Name | Type | Description |
|---|---|---|
| ready | bool | undefined |

### minDelay

```solidity
function minDelay() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### moduleFactory

```solidity
function moduleFactory() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### name

```solidity
function name() external view returns (string)
```

Returns the module name




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | The module name |

### proxiableUUID

```solidity
function proxiableUUID() external view returns (bytes32)
```



*Implementation of the ERC1822 {proxiableUUID} function. This returns the storage slot used by the implementation. It is used to validate that the this implementation remains valid after an upgrade. IMPORTANT: A proxy pointing at a proxiable contract should not be considered proxiable itself, because this risks bricking a proxy that upgrades to it, by delegating to itself until out of gas. Thus it is critical that this function revert if invoked through a proxy. This is guaranteed by the `notDelegated` modifier.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bytes32 | undefined |

### scheduleBatch

```solidity
function scheduleBatch(address[] targets, uint256[] values, bytes[] datas, bytes32 predecessor, bytes32 salt, uint256 delay) external nonpayable
```



*Schedule an operation containing a batch of transactions. Emits one {CallScheduled} event per transaction in the batch. - the caller must be authorized.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| targets | address[] | Contract addresses the DAO will call |
| values | uint256[] | Ether values to be sent to the target address |
| datas | bytes[] | Function Sigs w/ Params  |
| predecessor | bytes32 | GovTimelock passes this as 0 |
| salt | bytes32 | Description Hash |
| delay | uint256 | current delay set in contract |

### supportsInterface

```solidity
function supportsInterface(bytes4 interfaceId) external view returns (bool)
```

Returns whether a given interface ID is supported



#### Parameters

| Name | Type | Description |
|---|---|---|
| interfaceId | bytes4 | An interface ID bytes4 as defined by ERC-165 |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | bool Indicates whether the interface is supported |

### updateDelay

```solidity
function updateDelay(uint256 newDelay) external nonpayable
```



*Changes the minimum timelock duration for future operations. Emits a {MinDelayChange} event. Requirements: - the caller must be authorized.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| newDelay | uint256 | Update the delay between queue and execute |

### upgradeTo

```solidity
function upgradeTo(address newImplementation) external nonpayable
```



*Upgrade the implementation of the proxy to `newImplementation`. Calls {_authorizeUpgrade}. Emits an {Upgraded} event.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| newImplementation | address | undefined |

### upgradeToAndCall

```solidity
function upgradeToAndCall(address newImplementation, bytes data) external payable
```



*Upgrade the implementation of the proxy to `newImplementation`, and subsequently execute the function call encoded in `data`. Calls {_authorizeUpgrade}. Emits an {Upgraded} event.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| newImplementation | address | undefined |
| data | bytes | undefined |



## Events

### AdminChanged

```solidity
event AdminChanged(address previousAdmin, address newAdmin)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| previousAdmin  | address | undefined |
| newAdmin  | address | undefined |

### BeaconUpgraded

```solidity
event BeaconUpgraded(address indexed beacon)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| beacon `indexed` | address | undefined |

### CallExecuted

```solidity
event CallExecuted(bytes32 indexed id, uint256 indexed index, address target, uint256 value, bytes data)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| id `indexed` | bytes32 | undefined |
| index `indexed` | uint256 | undefined |
| target  | address | undefined |
| value  | uint256 | undefined |
| data  | bytes | undefined |

### CallScheduled

```solidity
event CallScheduled(bytes32 indexed id, uint256 indexed index, address target, uint256 value, bytes data, bytes32 predecessor, uint256 delay)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| id `indexed` | bytes32 | undefined |
| index `indexed` | uint256 | undefined |
| target  | address | undefined |
| value  | uint256 | undefined |
| data  | bytes | undefined |
| predecessor  | bytes32 | undefined |
| delay  | uint256 | undefined |

### Cancelled

```solidity
event Cancelled(bytes32 indexed id)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| id `indexed` | bytes32 | undefined |

### MinDelayChange

```solidity
event MinDelayChange(uint256 oldDuration, uint256 newDuration)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| oldDuration  | uint256 | undefined |
| newDuration  | uint256 | undefined |

### Upgraded

```solidity
event Upgraded(address indexed implementation)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| implementation `indexed` | address | undefined |



## Errors

### NotAuthorized

```solidity
error NotAuthorized()
```







