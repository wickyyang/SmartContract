pragma solidity ^0.5.0;

import "github.com/OpenZeppelin/openzeppelin-contracts/contracts/math/SafeMath.sol";
import "github.com/chirag-parmar/solidity-stringutils/blob/solidity_5_support/src/strings.sol";

contract Competitor {
    using SafeMath for uint256;
    using strings for *;

    // 设置管理员
    address private _admin;
    // 正答总人数
    uint256 private _competitorNum;
    // 前30名账户地址
    address[30] _competitorAddr;
    
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
        
        if (_competitorNum <= 30) {
            _competitorAddr[_competitorNum - 1] = msg.sender;
        }
    }
    
    // 查询参赛者信息登记情况
    function getCompetitorResult(string memory _mail) public view returns(string memory) {
        string memory result = "信息登记成功，节日快乐!";
        
        if (CompetitorInfoIndex[_mail].rank == 0) {
            result = "信息不存在!";
            return result;
        }
        
        return result;
    }
    
    // 通过邮箱获取正答者信息
    function getCompetitorInfo(string memory _mail) public view onlyAdmin returns (uint256, string memory, address, string memory, uint256) {
        require( CompetitorInfoIndex[_mail].rank != 0 );
        
        return( CompetitorInfoIndex[_mail].rank, CompetitorInfoIndex[_mail].name, CompetitorInfoIndex[_mail].addr, CompetitorInfoIndex[_mail].mail, CompetitorInfoIndex[_mail].time);
    }
    
    // 通过排名获取正答者邮箱
    function getCompetitorMail(uint256 _num) public view onlyAdmin returns (string memory) {
        require( _num > 0 && _num <= _competitorNum );
        
        return CompetitorRankIndex[_num];
    }
    
    // 前30位正答者账户地址
    function getAllAddr() public view onlyAdmin returns (address[30] memory) {
        return _competitorAddr;
    }
    
}