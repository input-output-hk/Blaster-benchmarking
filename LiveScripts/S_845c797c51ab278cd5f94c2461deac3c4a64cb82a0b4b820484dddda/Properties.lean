import LiveScripts.Shared
import LiveScripts.S_845c797c51ab278cd5f94c2461deac3c4a64cb82a0b4b820484dddda.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_845c797c51ab278cd5f94c2461deac3c4a64cb82a0b4b820484dddda.script [ctx] 10000]
