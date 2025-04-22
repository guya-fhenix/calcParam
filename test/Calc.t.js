const { expect } = require("chai"); // CommonJS module required for Hardhat
const hre = require("hardhat");
const { loadFixture } = require("@nomicfoundation/hardhat-toolbox/network-helpers");

describe("Calc contract", function () {
  async function deployCalcFixture() {
    const Calc = await ethers.getContractFactory("Calc");
    const calc = await Calc.deploy();
    return { calc };
  }

  it("Should add numbers correctly", async function () {
    const { calc } = await loadFixture(deployCalcFixture);
    const x = 5;
    const y = 3;
    const tx = await calc.add(x, y);
    await tx.wait();
    const result = await calc.getLatestResult();
    expect(result).to.equal(8);
  });

  it("Should subtract numbers correctly", async function () {
    const { calc } = await loadFixture(deployCalcFixture);
    const x = 5;
    const y = 3;
    const tx = await calc.sub(x, y);
    await tx.wait();
    const result = await calc.getLatestResult();
    expect(result).to.equal(2);
  });

  it("Should multiply numbers correctly", async function () {
    const { calc } = await loadFixture(deployCalcFixture);
    const x = 5;
    const y = 3;
    const tx = await calc.mul(x, y);
    await tx.wait();
    const result = await calc.getLatestResult();
    expect(result).to.equal(15);
  });

  it("Should divide numbers correctly", async function () {
    const { calc } = await loadFixture(deployCalcFixture);
    const x = 6;
    const y = 3;
    const tx = await calc.div(x, y);
    await tx.wait();
    const result = await calc.getLatestResult();
    expect(result).to.equal(2);
  });

  it("Should revert when dividing by zero", async function () {
    const { calc } = await loadFixture(deployCalcFixture);
    const x = 5;
    const y = 0;
    await expect(calc.div(x, y)).to.be.reverted;
  });

  it("Should emit CalcResult event", async function () {
    const { calc } = await loadFixture(deployCalcFixture);
    const x = 5;
    const y = 3;
    await expect(calc.add(x, y))
      .to.emit(calc, "CalcResult")
      .withArgs("Addition", 8);
  });
});
