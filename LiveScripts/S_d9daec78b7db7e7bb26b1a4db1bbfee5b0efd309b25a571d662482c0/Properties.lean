import LiveScripts.Shared
import LiveScripts.S_d9daec78b7db7e7bb26b1a4db1bbfee5b0efd309b25a571d662482c0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d9daec78b7db7e7bb26b1a4db1bbfee5b0efd309b25a571d662482c0.script [ctx] 10000]
