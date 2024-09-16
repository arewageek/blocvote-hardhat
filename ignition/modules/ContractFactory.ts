import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";
import { parseEther } from "viem";

const ContractFactoryModule = buildModule("ContractFactoryModule", (m) => {
  const cfactory = m.contract("ContractFactory");

  return { cfactory };
});

export default ContractFactoryModule;
