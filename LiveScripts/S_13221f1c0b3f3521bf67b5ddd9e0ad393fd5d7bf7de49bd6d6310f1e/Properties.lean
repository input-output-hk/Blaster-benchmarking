import LiveScripts.Shared
import LiveScripts.S_13221f1c0b3f3521bf67b5ddd9e0ad393fd5d7bf7de49bd6d6310f1e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_13221f1c0b3f3521bf67b5ddd9e0ad393fd5d7bf7de49bd6d6310f1e.script [ctx] 10000]
