// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 < 0.9.0;

import {Script} from "forge-std/Script.sol";
import "../src/Upload.sol";
import "forge-std/console.sol";

contract DeployUpload is Script {
    function setUp() public {}

    function run() public {
        uint privateKey = vm.envUint("PRIVATE_KEY");
        address account = vm.addr(privateKey);

        console.log("Library deployed to: ", account);

        vm.startBroadcast(privateKey);
        new Upload();
        vm.stopBroadcast();
    }

}