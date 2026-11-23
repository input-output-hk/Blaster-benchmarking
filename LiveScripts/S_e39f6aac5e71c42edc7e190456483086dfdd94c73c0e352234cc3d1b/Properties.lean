import LiveScripts.Shared
import LiveScripts.S_e39f6aac5e71c42edc7e190456483086dfdd94c73c0e352234cc3d1b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e39f6aac5e71c42edc7e190456483086dfdd94c73c0e352234cc3d1b.script [ctx] 10000]
