import LiveScripts.Shared
import LiveScripts.S_163bb361d8fc9b0e78347cc955df2750de39e0a577d6c3fd4ad0ea26.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_163bb361d8fc9b0e78347cc955df2750de39e0a577d6c3fd4ad0ea26.script [ctx] 10000]
