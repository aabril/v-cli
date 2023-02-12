module main

import os
import cli {Command, Flag}

fn main() {
    mut cmd := Command{
        name: "vcli"
        required_args: 0
        description: "request some popular http endpoints"
        usage: "vcli"
    }

    mut subcmd_hello_world := Command{
        name: "hello"
        required_args: 0
        description: "this just says hello to the world"
        usage: "vcli hello"
        execute: fn(cmd Command) ! {
            println(os.args)
            println("hello world")
        }
    }

    cmd.add_command(subcmd_hello_world)

    cmd.setup()
    cmd.parse(os.args)
}

