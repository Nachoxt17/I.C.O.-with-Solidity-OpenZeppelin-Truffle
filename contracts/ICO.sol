pragma solidity ^0.5.0;

/**+-Base S.C. for managing a token crowdsale, allowing investors to purchase tokens with ether. The external interface 
represents the basic interface for purchasing tokens, and conforms the base architecture for crowdsales:_*/
import "@openzeppelin/contracts/crowdsale/Crowdsale.sol";
/**+-If you use this option Investors will have to call the Function "PostDeliveryCrowdsale" to claim their Tokens ONLY after the I.C.O.
period so you don't have a secondary Market during it:_*/
import "@openzeppelin/contracts/crowdsale/distribution/PostDeliveryCrowdsale.sol";
//+-This Option allows you to have a determined lineal variable Price during your I.C.O.:_
import "@openzeppelin/contracts/crowdsale/price/IncreasingPriceCrowdsale.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ICO is Crowdsale, PostDeliveryCrowdsale, IncreasingPriceCrowdsale {
    constructor(
        uint256 rate,
        address payable wallet,
        IERC20 token
    )
        public
        Crowdsale(rate, wallet, token)
        PostDeliveryCrowdsale()
        IncreasingPriceCrowdsale(3, 1)
    {} /**+-("IncreasingPriceCrowdsale(3, 1)" means 3 Tokens for 1 Wei at the Beginning and 1 Token for 1 Wei at the End).*/
}
