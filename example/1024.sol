pragma solidity ^0.5.0;

import "github.com/chirag-parmar/solidity-stringutils/blob/solidity_5_support/src/strings.sol";

contract Competitor {
    using SafeMath for uint256;
    using strings for *;

    // 设置管理员
    address private _admin;
    // 正答总人数
    uint256 private _competitorNum;
    // 前100名账户地址
    address[100] _competitorAddr;

    // 正答者信息
    struct CompetitorInfo {
        // 排名
        uint256 rank;
        // 姓名
        string name;
        // 账户地址
        address addr;
        // 邮箱
        string mail;
        // 提交时间
        uint256 time;
    }
    
    mapping (string => CompetitorInfo) CompetitorInfoIndex;
    mapping (uint256 => string) CompetitorRankIndex;
    
    constructor() public {
        _admin = msg.sender;
    }
    
    modifier onlyAdmin {
        require (msg.sender == _admin);
        _;
    }
    
    // 记录正答者信息并排名
    function addCompetitorInfo(string memory _name, string memory _mail) public {
        require (CompetitorInfoIndex[_mail].rank == 0 );
        
        _competitorNum = _competitorNum.add(1);
        CompetitorInfoIndex[_mail].rank = _competitorNum;
        CompetitorInfoIndex[_mail].name = _name;
        CompetitorInfoIndex[_mail].addr = msg.sender;
        CompetitorInfoIndex[_mail].mail = _mail;
        CompetitorInfoIndex[_mail].time = now;
        
        CompetitorRankIndex[_competitorNum] = _mail;
        
        if (_competitorNum <= 100) {
            _competitorAddr[_competitorNum - 1] = msg.sender;
        }
    }
    
    // 查询参赛者信息登记情况
    function getCompetitorResult(string memory _mail) public view returns(string memory) {
        string memory result = "信息登记成功!第三题题目请看http://47.100.122.212:30077";
        
        if (CompetitorInfoIndex[_mail].rank == 0) {
            result = "信息不存在!";
            return result;
        }
        
        return result;
    }
    
    // 通过邮箱获取正答者信息
    function getCompetitorInfoFromMail(string memory _mail) public view onlyAdmin returns (uint256, string memory, address, string memory, uint256) {
        require( CompetitorInfoIndex[_mail].rank != 0 );
        
        return( CompetitorInfoIndex[_mail].rank, CompetitorInfoIndex[_mail].name, CompetitorInfoIndex[_mail].addr, CompetitorInfoIndex[_mail].mail, CompetitorInfoIndex[_mail].time);
    }
    
    // 通过排名获取正答者信息
    function getCompetitorInfoFromRank(uint256 _num) public view onlyAdmin returns (uint256, string memory, string memory, address, uint256) {
        require( _num > 0 && _num <= _competitorNum );
        
        string memory mail = CompetitorRankIndex[_num];
        return (CompetitorInfoIndex[mail].rank, mail, CompetitorInfoIndex[mail].name, CompetitorInfoIndex[mail].addr, CompetitorInfoIndex[mail].time);
    }
    
    // 前100位正答者账户地址
    function getAllAddr() public view onlyAdmin returns (address[100] memory) {
        return _competitorAddr;
    }
    
}

library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     *
     * _Available since v2.4.0._
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     *
     * _Available since v2.4.0._
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     *
     * _Available since v2.4.0._
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}
