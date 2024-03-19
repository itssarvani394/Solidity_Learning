// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.6;

contract A {
    function doSomething() external {
        // revert, require, assert -> all of these throw errors
        revert();
    }
}

contract B {
    // new also deploys the A contract
    A a = new A();
    string public status="Not available";

    function go() public {
        try a.doSomething() {
            status = "Success";
        }
        catch {
            status = "Failed";
        }
    }
}