import LiveScripts.Shared
import LiveScripts.S_e979870596ee4cbb8596355c9fbf61eac62b0091f70832e848f6602d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e979870596ee4cbb8596355c9fbf61eac62b0091f70832e848f6602d.script [ctx] 10000]
