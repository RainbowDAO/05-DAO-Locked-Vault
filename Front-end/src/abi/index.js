import vault from "./data/vault.json"
import erc20 from "./data/erc20.json"
const CONTRACTS = {
    vault:{address:"0x0b0220C342536171495057c6bC7421e9dA2D6f02",abi:vault},
    erc20:{abi:erc20},
};

function getContractByName(name, web3) {
    return new web3.eth.Contract(CONTRACTS[name].abi, CONTRACTS[name].address, {});
}

function getContractByContract(name, address, web3) {
    return new web3.eth.Contract(CONTRACTS[name].abi, address, {});
}

function getContractAddress(name) {
    return CONTRACTS[name].address;
}

export default {
    CONTRACTS,
    getContractByName,
    getContractByContract,
    getContractAddress
};
