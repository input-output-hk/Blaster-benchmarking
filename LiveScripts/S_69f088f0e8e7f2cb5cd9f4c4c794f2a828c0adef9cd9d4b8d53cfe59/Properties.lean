import LiveScripts.Shared
import LiveScripts.S_69f088f0e8e7f2cb5cd9f4c4c794f2a828c0adef9cd9d4b8d53cfe59.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_69f088f0e8e7f2cb5cd9f4c4c794f2a828c0adef9cd9d4b8d53cfe59.script [ctx] 10000]
