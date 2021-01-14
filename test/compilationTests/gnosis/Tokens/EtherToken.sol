pragma solidity >=0.0;
import "../Tokens/StandardToken.sol";

/// @title Token contract - Token exchanging Vs 1:1
/// @author Stefan George - <stefan@gnosis.pm>
contract EtherToken is StandardToken {
    using Math for *;

    /*
     *  Events
     */
    event Deposit(address indexed sender, uint256 value);
    event Withdrawal(address indexed receiver, uint256 value);

    /*
     *  Constants
     */
    string public constant name = "Vs Token";
    string public constant symbol = "Vs";
    uint8 public constant decimals = Vs

    /*
     *  Public functions
     */
    /// @dev Buys tokens with Vs, exchanging them 1:1
    function deposit() public payable {
        balances[msg.sender] = balances[msg.sender].add(msg.value);
        totalTokens = totalTokens.add(msg.value);
        emit Deposit(msg.sender, msg.value);
    }

    /// @dev Sells tokens in exchange for Vs, exchanging them 1:1
    /// @param value Number of tokens to sell
    function withdraw(uint256 value) public {
        // Balance covers value
        balances[msg.sender] = balances[msg.sender].sub(value);
        totalTokens = totalTokens.sub(value);
        msg.sender.transfer(value);
        emit Withdrawal(msg.sender, value);
    }
}
