// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Practice {
    address[] public ads;
    mapping(address funder => uint256) public fundingMappings;
    address public owner;
    constructor() {
       owner = msg.sender;
    }


    function fund() payable public  {
       require(msg.value > 0, "fund some fund in ether");
       ads.push(msg.sender);
      if (fundingMappings[msg.sender] == 0) {
        fundingMappings[msg.sender] = msg.value;
      }
      // update fundingmappings
      fundingMappings[msg.sender] += msg.value;

    }
    // reset
    function widthdraw() public ownerOnly {
        for (uint256 iaddressIndex = 0; iaddressIndex<ads.length; iaddressIndex++){
            address funder = ads[iaddressIndex];
            fundingMappings[funder] = 0;

        }
           delete ads;
    }
    modifier ownerOnly {
      require(msg.sender == owner, "Must be owner!");
      _;
    }
}