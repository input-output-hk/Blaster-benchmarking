import LiveScripts.Shared
import LiveScripts.S_b9a405b0268cca62832c0ab8cd04bbe0c64cff0213d9390608c9187d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b9a405b0268cca62832c0ab8cd04bbe0c64cff0213d9390608c9187d.script [ctx] 10000]
