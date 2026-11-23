import LiveScripts.Shared
import LiveScripts.S_0a0ca2a8f983a578ace6e775912e4c97043bb2c0ca3cea0d66191f0d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0a0ca2a8f983a578ace6e775912e4c97043bb2c0ca3cea0d66191f0d.script [ctx] 10000]
