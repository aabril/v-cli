module commands

import os
import cli {Command, Flag}

fn hello_subcommand(cmd Command) ! {
        println(os.args)
        println("hello world")
}

pub fn set() {
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
        execute: hello_subcommand
    }

    cmd.add_command(subcmd_hello_world)

    cmd.setup()
    cmd.parse(os.args)
}
