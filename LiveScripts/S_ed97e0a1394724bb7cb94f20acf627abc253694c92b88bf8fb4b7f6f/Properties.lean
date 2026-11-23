import LiveScripts.Shared
import LiveScripts.S_ed97e0a1394724bb7cb94f20acf627abc253694c92b88bf8fb4b7f6f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ed97e0a1394724bb7cb94f20acf627abc253694c92b88bf8fb4b7f6f.script [ctx] 10000]
