import LiveScripts.Shared
import LiveScripts.S_5ff03dd084ec86a164dbf9bfe890605fe9fcba8d6657328eab8bb350.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5ff03dd084ec86a164dbf9bfe890605fe9fcba8d6657328eab8bb350.script [ctx] 10000]
