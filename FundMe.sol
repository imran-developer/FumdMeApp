// get a funds from users
// withdraw
// set a minimum funding values in USD

// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;
interface AggregatorV3Interface {
    function decimals() external view returns (uint256) ;

    function description () external  view returns (string memory);

    function version () external view returns (uint256);
     function latestRoundData()
        external
        view
        returns (
            uint80 roundId,
            int256 answer,        // the price
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        );

}

contract FundMe {
    uint256  public myValue = 1;

    function func() public payable  {
        // Allow users to send $
        // Have a minimum $ sent
        // How do we send Eth to this contract ?
        myValue = myValue + 2;
        require(msg.value > 1e18, "Didt send enough ETH");
        // what is revert ?
        // undo any action that have been done and send the remainng gas back
    }
   function getPrice () public  {
    // address : 0x694AA1769357215DE4FAC081bf1f309aDC325306
    // ABI

    }

    function getVersion () public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }
function getLatestPrice () public view returns (int256) {
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

    return price;
}


    function withdraw () public {}
}