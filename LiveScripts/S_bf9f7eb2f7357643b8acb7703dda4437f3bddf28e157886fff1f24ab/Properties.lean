import LiveScripts.Shared
import LiveScripts.S_bf9f7eb2f7357643b8acb7703dda4437f3bddf28e157886fff1f24ab.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_bf9f7eb2f7357643b8acb7703dda4437f3bddf28e157886fff1f24ab.script [ctx] 10000]
