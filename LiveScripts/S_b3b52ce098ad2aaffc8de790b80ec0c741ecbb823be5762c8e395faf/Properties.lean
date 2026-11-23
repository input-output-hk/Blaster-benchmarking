import LiveScripts.Shared
import LiveScripts.S_b3b52ce098ad2aaffc8de790b80ec0c741ecbb823be5762c8e395faf.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b3b52ce098ad2aaffc8de790b80ec0c741ecbb823be5762c8e395faf.script [ctx] 10000]
