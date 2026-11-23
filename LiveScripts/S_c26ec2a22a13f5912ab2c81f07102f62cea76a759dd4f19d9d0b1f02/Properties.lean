import LiveScripts.Shared
import LiveScripts.S_c26ec2a22a13f5912ab2c81f07102f62cea76a759dd4f19d9d0b1f02.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c26ec2a22a13f5912ab2c81f07102f62cea76a759dd4f19d9d0b1f02.script [ctx] 10000]
