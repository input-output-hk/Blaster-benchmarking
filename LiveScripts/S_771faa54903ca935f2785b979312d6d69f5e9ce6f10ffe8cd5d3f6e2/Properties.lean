import LiveScripts.Shared
import LiveScripts.S_771faa54903ca935f2785b979312d6d69f5e9ce6f10ffe8cd5d3f6e2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_771faa54903ca935f2785b979312d6d69f5e9ce6f10ffe8cd5d3f6e2.script [ctx] 10000]
