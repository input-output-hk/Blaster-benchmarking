import LiveScripts.Shared
import LiveScripts.S_470f6e7a4f1292594aaad8b2777a6a31a3af8109c0d217c11033fb42.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_470f6e7a4f1292594aaad8b2777a6a31a3af8109c0d217c11033fb42.script [ctx] 10000]
