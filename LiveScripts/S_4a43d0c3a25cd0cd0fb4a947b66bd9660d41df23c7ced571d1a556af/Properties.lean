import LiveScripts.Shared
import LiveScripts.S_4a43d0c3a25cd0cd0fb4a947b66bd9660d41df23c7ced571d1a556af.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4a43d0c3a25cd0cd0fb4a947b66bd9660d41df23c7ced571d1a556af.script [ctx] 10000]
