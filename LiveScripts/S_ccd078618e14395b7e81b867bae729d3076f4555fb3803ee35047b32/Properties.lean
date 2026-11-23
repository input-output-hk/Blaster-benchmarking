import LiveScripts.Shared
import LiveScripts.S_ccd078618e14395b7e81b867bae729d3076f4555fb3803ee35047b32.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ccd078618e14395b7e81b867bae729d3076f4555fb3803ee35047b32.script [ctx] 10000]
