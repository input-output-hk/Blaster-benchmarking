import LiveScripts.Shared
import LiveScripts.S_837d6e84194b12775886f2f0e633c8fd5e957368ab4ebee98eaac5c0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_837d6e84194b12775886f2f0e633c8fd5e957368ab4ebee98eaac5c0.script [ctx] 10000]
