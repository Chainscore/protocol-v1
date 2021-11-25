// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

interface FulfillContract {
    function fulfillScore(address _user, uint256 _score) external;
}

contract ScoreProtocol is Ownable {
    
    IERC20 sScoreToken;
    IERC20 scoreToken;

    uint256 _requestFees;
    uint256 _stakeRequired;

    event ScoreRequest(address _user, address _contract);
    
    constructor(
        uint256 _stakeAmount, address _score, address _sScore, uint256 _fees
        ) 
    {
        _stakeRequired = _stakeAmount;
        
        scoreToken = IERC20(_score);
        sScoreToken = IERC20(_sScore);

        _requestFees = _fees;
    }

    function setStakeRequired(uint256 _newStakeRequired) 
    public onlyOwner{
        _stakeRequired = _newStakeRequired;
    }

    function stakeRequired() 
    public view returns(uint256){
        return _stakeRequired;
    }

    function fees() 
    public view returns(uint256){
        return _requestFees;
    }

    function getScore(address _user) 
    public {
        
        scoreToken.transferFrom(msg.sender, address(this), fees());
        emit ScoreRequest(_user, msg.sender);
    }

    function fulfillScore(address _user, address _contract, uint256 _score) 
    public {
        require(
            sScoreToken.balanceOf(msg.sender) >= stakeRequired(), 
            "Staking is required to submit score"
            );

        FulfillContract(_contract).fulfillScore(_user, _score);
    }
}