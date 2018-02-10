pragma solidity ^0.4.2;
import "./Product.sol";
import "./owned.sol";

contract Seller is Owned{
    event NewSeller (address indexed _seller);
    uint256 constant sellerCost = 1 ether;
    mapping (address => bool) isSeller;
    mapping (address => mapping (uint256 => Product.Merchandise)) goods;
    mapping (address => mapping (uint256 => bool)) isProduct;
    mapping (address => uint256) nextProductIDs;


    struct Vendor {
        uint256 posRatings;
        uint256 negRatings;
        uint256 timeLastActive;
    }

    mapping (address => Vendor) sellers;

    function becomeSeller (address _seller) external payable {
        require (msg.sender == _seller);
        require (isSeller[_seller] == false);
        require (msg.value >= sellerCost);
        isSeller[_seller] = true;
        NewSeller(_seller);
    }
}