pragma solidity ^0.6.0 <0.6.11;

import './Utils.sol';
import '@openzeppelin/contracts/access/Ownable.sol';
import '@openzeppelin/contracts/token/ERC20/ERC20Burnable.sol';
import '@openzeppelin/contracts/token/ERC20/ERC20Pausable.sol';

/**
    ERC20 Standard Token implementation
*/
contract BlockcertToken is ERC20Burnable, ERC20Pausable, Ownable, Utils {
	string public standard = 'VideoToken';
	uint postPrice = 30;

	/**
	*	@dev constructor
	*
	*/
    constructor () public
	ERC20("VideoToken", "VTT")
	{
		_mint(_msgSender(), 2100000000);
	}

	/**
		 @dev renounceOwnership disabled
	*/

	function renounceOwnership() public override {
		revert("renouncing ownership is blocked");
	}

	/**
		 @dev renounceOwnership disabled
	*/

	function likeVideo() public {
		_mint(_msgSender(), 1);
	}

	function postVideo() public {
		_burn(postPrice);
	}

	function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual override(ERC20, ERC20Pausable) {
		super._beforeTokenTransfer(from, to, amount);
	}
}
