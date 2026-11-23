import LiveScripts.Shared
import LiveScripts.S_71b00bb6a54422cad7de4e784ced3a1aa9cd2974303f89d026b8756c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_71b00bb6a54422cad7de4e784ced3a1aa9cd2974303f89d026b8756c.script [datum, redeemer, ctx] 10000]
