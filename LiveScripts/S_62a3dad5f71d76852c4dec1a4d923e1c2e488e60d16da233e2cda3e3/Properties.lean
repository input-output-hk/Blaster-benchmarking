import LiveScripts.Shared
import LiveScripts.S_62a3dad5f71d76852c4dec1a4d923e1c2e488e60d16da233e2cda3e3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_62a3dad5f71d76852c4dec1a4d923e1c2e488e60d16da233e2cda3e3.script [ctx] 10000]
