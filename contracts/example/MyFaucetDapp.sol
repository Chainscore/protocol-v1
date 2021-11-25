// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "../interfaces/IScoreProtocol.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract MyFaucetDapp{

    address exToken;
    address scoreToken;

    address ScoreClient;

    event InsuffientScore(address _user);
    event TokensSent(address _user, uint256 _amount);

    mapping(address => uint256) pendingRequests;

    constructor(address _example, address _score, address _scoringContract){
        exToken = _example;
        scoreToken = _score;
        ScoreClient = _scoringContract;
    }

    // user makes request to send tokens
    // request will be fulfilled after scorer returns score and score > 0 in fulfillScore()
    function sendMeTokens(uint256 _amount) public {
        require(_amount>0 && _amount<10000000000000, "Enter a amount > 0 and < 10000000000000");
        pendingRequests[msg.sender] += _amount;

        uint256 fees = IScoreProtocol(ScoreClient).fees();

        IERC20(scoreToken).approve(ScoreClient, fees);
        IScoreProtocol(ScoreClient).getScore(msg.sender);
    }

    // called by scorer node -> with returned score
    // use custom logic to evaluate risk and send tokens
    function fulfillScore(address _user, uint256 _score) external {
        if(_score < 0){
            emit InsuffientScore(_user);
            return;
        }
        else{
            IERC20(exToken).transfer(_user, pendingRequests[_user]);
        }
    }

}