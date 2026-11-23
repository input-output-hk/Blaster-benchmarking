import LiveScripts.Shared
import LiveScripts.S_7f457b5a440ee20719e3b55e7183041d447d9bea7b49bb30b38f2027.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7f457b5a440ee20719e3b55e7183041d447d9bea7b49bb30b38f2027.script [ctx] 10000]
