import LiveScripts.Shared
import LiveScripts.S_2cd1bbc992e8cd6581bc8201907dc3249cf2bef6773434662072ac92.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2cd1bbc992e8cd6581bc8201907dc3249cf2bef6773434662072ac92.script [datum, redeemer, ctx] 10000]
