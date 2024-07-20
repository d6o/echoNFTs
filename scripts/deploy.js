async function main() {
    const EchoNFT = await ethers.getContractFactory("EchoNFT");
    const echoNFT = await EchoNFT.deploy();
    await echoNFT.deployed();
    console.log("EchoNFT deployed to:", echoNFT.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
