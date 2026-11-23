import LiveScripts.Shared
import LiveScripts.S_785f4a6b85a3b5d21dc83ff16e2eb1482f1c8635f4f6837b7fe51c02.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_785f4a6b85a3b5d21dc83ff16e2eb1482f1c8635f4f6837b7fe51c02.script [ctx] 10000]
