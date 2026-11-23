import LiveScripts.Shared
import LiveScripts.S_0752d1a38bf34de7d503407b47080fa22ad01ad5c44ec5d18d1e1a32.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0752d1a38bf34de7d503407b47080fa22ad01ad5c44ec5d18d1e1a32.script [ctx] 10000]
