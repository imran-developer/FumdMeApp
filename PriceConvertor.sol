// SPDX-License-Identifier: MIT
pragma solidity 0.8.24 ;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
library PriceConvertor {
       function getPrice () internal   {
    // address : 0x694AA1769357215DE4FAC081bf1f309aDC325306
    // ABI

    }

    function getVersion () internal   view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }
function getLatestPrice () internal  view returns (uint256) {
    AggregatorV3Interface priceFeed = AggregatorV3Interface(
        0x694AA1769357215DE4FAC081bf1f309aDC325306
    );

    (
        ,               // roundId (ignore)
        int256 price,   // <-- we want this
        ,               // startedAt (ignore)
        ,            // updatedAt (ignore)
        // answeredInRound (ignore)
    ) = priceFeed.latestRoundData();

    return uint256(price * 1e18);
}
function PriceConversion (uint256 ethAmount) internal view returns(uint256){
  uint256  ethPrice = getLatestPrice();
 uint256 ethintoUsd = (ethPrice * ethAmount) / 1e18;
 return ethintoUsd;

}


}