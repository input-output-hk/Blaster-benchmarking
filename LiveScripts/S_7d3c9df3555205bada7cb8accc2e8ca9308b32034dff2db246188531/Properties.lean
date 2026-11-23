import LiveScripts.Shared
import LiveScripts.S_7d3c9df3555205bada7cb8accc2e8ca9308b32034dff2db246188531.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7d3c9df3555205bada7cb8accc2e8ca9308b32034dff2db246188531.script [ctx] 10000]
