import LiveScripts.Shared
import LiveScripts.S_fc22f2097279b418f81c7ece96cacacf19534c03f2b55381e96535e5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fc22f2097279b418f81c7ece96cacacf19534c03f2b55381e96535e5.script [ctx] 10000]
