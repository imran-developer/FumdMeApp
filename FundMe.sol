
// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;
import {PriceConvertor} from './PriceConvertor.sol';

contract FundMe {
    using PriceConvertor for uint256;
    uint256  public constant myValue = 1;
    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;
    address public immutable _owner;
    constructor () {
        _owner = msg.sender;
    }


    function fund() public payable  {
        // Allow users to send $
        // Have a minimum $ sent
        // How do we send Eth to this contract ?
        require(msg.value.PriceConversion() >= myValue, "Didt send enough ETH");

        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;

        // what is revert ?
        // undo any action that have been done and send the remainng gas back
    }
    function withdraw () public ownerOnly{
        require(msg.sender == _owner, "Must be owner!");
        for (uint256 funderIndex = 0; funderIndex <= funders.length; funderIndex++ ){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0);

        // transfer
        // payable(msg.sender).transfer(address(this).balance);
        
        // send return bool
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "transfer failed");

        // call // return two variable bool , bytes // recommended for transfer eth
        // (bool callSuccess, bytes memory dataReturned ) = payable(msg.sender).call{value: address(this).balance}("");
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "call failed");

    }
    modifier ownerOnly {
        require(msg.sender == _owner, "Must be owner!");
        _;
    }
}