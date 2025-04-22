async function main() {
    console.log("PRIVATE_KEY exists:", !!process.env.PRIVATE_KEY);
    console.log("ARBISCAN_API_KEY exists:", !!process.env.ARBISCAN_API_KEY);

    const [deployer] = await ethers.getSigners();

    console.log("Deploying contracts with the account:", deployer.address);
    console.log("Account balance:", (await deployer.provider.getBalance(deployer.address)).toString());

    const Calc = await ethers.getContractFactory("Calc");
    const calc = await Calc.deploy();

    await calc.waitForDeployment();

    console.log("Contract deployed to:", await calc.getAddress());
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });