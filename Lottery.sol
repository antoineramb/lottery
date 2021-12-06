pragma solidity >=0.7.0 <0.9.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

contract Lottery {
  address public manager;
  address token_adress;
  address public last_winner;
  struct Player {
      address wallet;
      uint256 number_selected;
  }
  Player[] public players;

  constructor(address _token_adress) public {
    manager = msg.sender;
    token_adress = _token_adress;
  }

  function enter(uint256 numb) public payable{ 
      require(msg.value > 1000);
      players.push(Player(msg.sender, numb));
  }


  function random() public view returns (uint) {
    uint number = 1;
    return number;
}


    function pickWinner() public returns (address wallet) { 
    uint winner_number = random();
    for (uint i = 0; i < players.length; i++) {
        if (winner_number == players[i].number_selected) {
            IERC20(token_adress).transfer(players[i].wallet, 1000);
            last_winner = players[i].wallet;
        }
    }
    
    
  }


}