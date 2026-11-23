import LiveScripts.Shared
import LiveScripts.S_579a60a9255fa93814a23daa4b55110475098398f400b5a07c4657df.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_579a60a9255fa93814a23daa4b55110475098398f400b5a07c4657df.script [datum, redeemer, ctx] 10000]
