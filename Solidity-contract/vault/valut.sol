pragma solidity ^0.8.0;
import '../interface/IERC20.sol';
//import '../TransferHelper.sol';

contract valut {
    address public owner;
    string public name;
    string public intro;
    string public logo;
    uint public time ;
    uint public index;
    uint public index1;
    uint public index2;
    address public rbd;

    event Deposit(address addr,address to, uint amount);
    event Withdraw(address to, uint amount,bool choose);
    event CreatVault(string name,string intro,string logo,uint completeClosurePeriod,uint monthlyReleaseRatio,uint AlertPayDayRule);
    mapping(address=>bool)status;
    mapping(address=> userInfo) info;
    struct userInfo{
        //uint id;
        string valut;
        address valutAddress;
        address user;
        uint amount;
        uint time;
    }
    userInfo[]public list2;
    mapping(address=>AlertPayRule) alertPayRules;
    struct AlertPayRule{
        uint completeClosurePeriod ;
        uint ReleasePeriod;
        uint monthlyReleaseRatio;
        uint AlertPayDayRule;
    }
    //mapping (address=>certigierInfo) certigier;
    mapping (address=>uint) amounts;
    struct withdrawalInfo{
        address owner;
        uint time;
        uint amount;
    }
    withdrawalInfo[]public list;
    struct manageinfo{
       address owner;
       uint proportion;
       bool pause;
       bool termination;
   }
   manageinfo[]public list3;
    constructor(address _rbd) public {
        rbd = _rbd;
    }
  
    function creatVault(string memory _name,string memory _intro,string memory _logo,uint completeClosurePeriod,uint ReleasePeriod,uint monthlyReleaseRatio,uint AlertPayDayRule)public{
        owner=msg.sender;
        name=_name;
        intro=_intro;
        logo=_logo;
        AlertPayRule memory info1= AlertPayRule({
      
            completeClosurePeriod:24,
            ReleasePeriod:ReleasePeriod,
            monthlyReleaseRatio:monthlyReleaseRatio,
            AlertPayDayRule:AlertPayDayRule

        });
        
    }
    
    
    function deposit(address rbd, uint amount ) public {
        uint32 blockTime=uint32(block.timestamp % 2 ** 32);
        uint userBalance=IERC20(rbd).balanceOf(msg.sender);

        //require (amount<=userBalance,"There aren't enough tokens");
        index=index+1; 
        IERC20(rbd).transferFrom(msg.sender,address(this),amount);
        time=blockTime;
        userInfo memory userinfo=userInfo({
            //id: id,
            valut:name,
            valutAddress:address(this),
            user:msg.sender,
            amount:amount,
            time:blockTime
        });
        list2.push(userinfo);
    }

    function withdraw(address rbd,address to ,uint amount,uint number)public{
         
        index1=index1+1;
         if (msg.sender==to){
            uint32 blockTime = uint32(block.timestamp % 2 ** 32);
            if(number==1){
               // IERC20(rbd).transferFrom(address(this),msg.sender,amount);
                withdrawalInfo memory infos=withdrawalInfo({
                    owner:to,
                    time:blockTime,
                    amount:amount
                });
                list.push(infos);
                
            }
            if (number==2){
                if(alertPayRules[address(this)].AlertPayDayRule==0){
                    uint amounts=(((blockTime-time)/86400)*alertPayRules[address(this)].monthlyReleaseRatio/100)*info[msg.sender].amount;
                     //amounts=(userInfo.amonut/1000)*((blockTime-time)/86400);
                    require(amount<=amounts,"Exceeds withdrawal amount");
                     IERC20(rbd).transfer(to,amount);
                }
                if (alertPayRules[address(this)].AlertPayDayRule!=0){
                    uint amounts=((blockTime-time)/2592000)*alertPayRules[address(this)].AlertPayDayRule*info[msg.sender].amount;
                    require(amount<=amounts,"Exceeds withdrawal amount");
                    IERC20(rbd).transfer(to,amount);
                }
            }
        }
        else{
            require(status[to]==true,"not authorized");
            require(amount <=list2[index].amount*amounts[to]);
            uint32 blockTime = uint32(block.timestamp % 2 ** 32);
            uint time2=info[to].time+(alertPayRules[address(this)].completeClosurePeriod+alertPayRules[address(this)].ReleasePeriod)*2592000;
            require(blockTime>=time2);  
            IERC20(rbd).transfer(to,amount);
            // uint balance=IERC20(rbd).balanceOf(address(this));
            // reserve =balance ;                                                                                                                                                                                     
        }
    }
    function approves(address to,uint rate)public{
        index2=index2+1;
        //require(msg.sender==owner);
        //require(msg.sender !=to);
        manageinfo memory info=manageinfo({
            owner:to,
            proportion:rate,
            pause:true,
            termination:true
        });
        list3.push(info);
    }

    function cancelApprove(address to )public{
        list3[index2].pause==false;
    }

    function getAlertPayRule()public view returns(AlertPayRule memory){
        return alertPayRules[address(this)];
    }

    function getBanlance()public view returns(uint){
        return list2[0].amount;
    }

    function getName()public view returns(string memory ){
        return name;
    }
   function depositAmount()public view returns(uint){
       return list2[index].amount;
       
   }
}