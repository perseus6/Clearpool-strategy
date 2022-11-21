// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

interface IPoolFactory {

  struct ManagerInfo {
    address currency;
    address pool;
    address staker;
    uint32 proposalId;
    uint256 stakedAmount;
    bytes32 ipfsHash;
    string managerSymbol;
  }

  function cpool() external view returns (address);
  function staking() external view returns (address);
  function flashGovernor() external view returns (address);
  function poolBeacon() external view returns (address);
  function interestRateModel() external view returns (address);
  function auction() external view returns (address);
  function treasury() external view returns (address);

  function reserveFactor() external view returns (uint256);
  function insuranceFactor() external view returns (uint256);
  function warningUtilization() external view returns (uint256);
  function provisionalDefaultUtilization() external view returns (uint256);
  function warningGracePeriod() external view returns (uint256);
  function maxInactivePeriod() external view returns (uint256);
  function periodToStartAuction() external view returns (uint256);

  function currencyAllowed(address) external view returns (bool);
  function isPool(address) external view returns (bool);
  function getPools() external view returns (address[] memory);
  function managerInfo(address) external view returns (ManagerInfo memory);

  function getPoolSymbol(address currency, address manager)
    external view returns (string memory);
}
