// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

import "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";

interface IPoolMaster is IERC20Metadata {

    enum State {
        Active,
        Warning,
        ProvisionalDefault,
        Default,
        Closed
    }

    function manager() external view returns (address);
    function currency() external view returns (address);
    function factory() external view returns (address);

    function state() external view returns (State);
    function lastAccrual() external view returns (uint256);
    function interest() external view returns (uint256);
    function availableToWithdraw() external view returns (uint256);
    function availableToBorrow() external view returns (uint256);
    function poolSize() external view returns (uint256);
    function principal() external view returns (uint256);
    function borrows() external view returns (uint256);

    function enteredZeroUtilization() external view returns (uint256);
    function enteredProvisionalDefault() external view returns (uint256);

    function getCurrentExchangeRate() external view returns (uint256);
    function getBorrowRate() external view returns (uint256);
    function getSupplyRate() external view returns (uint256);
    function getUtilizationRate() external view returns (uint256);

    function withdrawableRewardOf(address account) external view returns (uint256);

    function withdrawReward(address account) external returns (uint256);
    function redeem(uint256 tokens) external;
    function redeemCurrency(uint256 currencyAmount) external;
    function provide(uint256 currencyAmount) external;
}